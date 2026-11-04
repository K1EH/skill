#!/usr/bin/env bash
# 작업 공간 루트에서 실행한다. 기존 파일은 덮어쓰지 않으며 다시 실행해도 안전하다.
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WS="$(pwd)"

if [ "$KIT" = "$WS" ]; then
  echo "이 저장소가 아니라 과제 작업 공간 루트에서 실행하세요." >&2
  exit 1
fi

for s in 1-kickoff 2-build 3-finish; do
  if [ ! -f "$KIT/skills/$s/SKILL.md" ]; then
    echo "스킬 파일이 없습니다: $KIT/skills/$s/SKILL.md" >&2
    exit 1
  fi
done

mkdir -p .agents/skills docs logs

for s in 1-kickoff 2-build 3-finish; do
  if [ -e ".agents/skills/$s" ]; then
    echo "유지: .agents/skills/$s"
  else
    cp -R "$KIT/skills/$s" ".agents/skills/$s"
    echo "설치: .agents/skills/$s"
  fi
done

for f in DECISIONS.md TASKS.md AI_LOG.md; do
  if [ -e "docs/$f" ]; then
    echo "유지: docs/$f"
  else
    cp "$KIT/templates/$f" "docs/$f"
    echo "생성: docs/$f"
  fi
done

AGENTS_WARNING=""
if [ ! -e AGENTS.md ]; then
  cp "$KIT/templates/AGENTS.md" AGENTS.md
  echo "생성: AGENTS.md"
elif cmp -s AGENTS.md "$KIT/templates/AGENTS.md"; then
  echo "유지: AGENTS.md"
else
  cp "$KIT/templates/AGENTS.md" AGENTS.kit.md
  AGENTS_WARNING="기존 AGENTS.md가 있어 그대로 두고 AGENTS.kit.md에 규칙을 저장했습니다. Codex 첫 요청에 'AGENTS.kit.md를 읽고 따라줘'를 포함하세요."
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init -q
  echo "생성: git 저장소"
fi
git config user.name >/dev/null 2>&1 || git config user.name "candidate"
git config user.email >/dev/null 2>&1 || git config user.email "candidate@example.invalid"

EXCLUDE="$(git rev-parse --git-path info/exclude)"
mkdir -p "$(dirname "$EXCLUDE")"
for pattern in 'logs/' 'docs/next_question.txt'; do
  grep -qx "$pattern" "$EXCLUDE" 2>/dev/null || echo "$pattern" >> "$EXCLUDE"
done

echo
if [ -n "$AGENTS_WARNING" ]; then
  echo "주의: $AGENTS_WARNING"
fi
command -v codex >/dev/null 2>&1 || echo "주의: codex 명령을 찾지 못했습니다."
for tool in node python3; do
  if command -v "$tool" >/dev/null 2>&1; then
    echo "$tool: $("$tool" --version 2>&1)"
  fi
done
echo
echo "완료. 이제 이 폴더에서 codex를 실행하세요. AGENTS.md는 Codex 세션이 시작될 때 읽힙니다."
echo "첫 요청: \$1-kickoff 과제 README와 제공 파일을 읽고 시작해줘."
