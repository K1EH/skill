# 출처 및 라이선스

이 저장소의 스킬은 아래 공개 스킬의 절차를 한국어로 번역·축약·수정해 만들었습니다. 공식 배포판이나 경량판이 아니며, 원저작자의 보증·제휴를 의미하지 않습니다. 각 스킬의 LICENSE에 해당 고지와 라이선스 전문이 있습니다.

| 원본 | 프로젝트 | 가져온 내용 | 쓰인 곳 | 라이선스 |
| --- | --- | --- | --- | --- |
| brainstorming | [obra/superpowers](https://github.com/obra/superpowers) | 묻기 전에 읽기, 구체적인 질문 하나씩, 접근 방식 비교, 짧은 설계 문서, 독립 검수의 세 갈래 분류, 승인 전 구현 금지 | 1-kickoff, 2-prd | MIT, Copyright (c) 2025 Jesse Vincent |
| writing-plans | obra/superpowers | 파일 구조, 결정만 적는 작업, 문서 자체 점검, 요구사항이 말하지 않은 입력 | 2-prd, 3-core, 4-build | 같음 |
| systematic-debugging | obra/superpowers | 근본 원인 우선, 4단계, 반복 실패 시 설계 재검토 | 3-core | 같음 |
| dispatching-parallel-agents | obra/superpowers | 위임 판단, 프롬프트 구조, 복귀 후 확인 | 4-build | 같음 |
| verification-before-completion | obra/superpowers | 증거 규칙, 5단계 확인, 주장별 증거 표, 멈춤 신호 | 5-finish | 같음 |
| clarify | [github/spec-kit](https://github.com/github/spec-kit) | 범주별 판정, 영향×불확실성, 질문 하나씩, 답의 즉시 반영 | 1-kickoff | MIT, Copyright GitHub, Inc. |
| analyze | github/spec-kit | 점검 항목, 심각도, 먼저 찾고 나중에 고치기 | 5-finish | 같음 |
| frontend-design | [anthropics/skills](https://github.com/anthropics/skills) | 코드 전 짧은 계획, 원문과 대조, 시각·문구 원칙 | 4-build | Apache-2.0, 수정함 |
| define-goal | [openai/skills](https://github.com/openai/skills) | 측정 가능한 완료 조건, 멈춤 조건 (아이디어만 참고) | 2-prd | Apache-2.0 |
| 질문 형식, D·R ID | v1 ([devbrother2024/skills](https://github.com/devbrother2024/skills), [snarktank/ralph](https://github.com/snarktank/ralph) 참고) | 선택지가 있는 결정 질문, ID로 잇는 요구사항 (아이디어만 참고) | 1-kickoff, 2-prd | MIT |

데이터 프로파일, 기준 후보 비교, 담당자 질문 형식, 규모 게이트(G3), 시나리오 점검, 서술형 대비 요약은 이 프로젝트에서 새로 작성했습니다. 원본 확인일은 2026-11-04입니다.

뺀 것: TDD 강제, 시각화 도구, 긴 설계 문서, worktree, 프로젝트 헌장 검사, 코드 리뷰 스킬, 보안 스킬.
