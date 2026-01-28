# 기업 분석 블로그

기업 분석 공부 내용을 기록하는 Jekyll 블로그입니다.

## 🚀 빠른 시작

### 1. GitHub에 저장소 만들기

```bash
# 이 폴더에서 Git 초기화
git init
git add .
git commit -m "Initial commit: 블로그 세팅"

# GitHub에서 'research' 저장소 생성 후
git remote add origin https://github.com/YOUR_USERNAME/research.git
git branch -M main
git push -u origin main
```

### 2. GitHub Pages 활성화

1. GitHub 저장소 → Settings → Pages
2. Source를 "GitHub Actions"로 선택
3. 저장하면 자동 배포 시작!

### 3. _config.yml 수정

```yaml
url: "https://YOUR_USERNAME.github.io"
```

`YOUR_USERNAME`을 본인 GitHub 아이디로 변경

---

## 📝 새 분석 글 작성하기

### 한국 기업

```bash
# _drafts 폴더의 템플릿 복사
cp _drafts/TEMPLATE-korea.md _posts/2026-01-28-삼성전자-분석.md
```

### 미국 기업

```bash
cp _drafts/TEMPLATE-usa.md _posts/2026-01-28-apple-analysis.md
```

### 파일명 규칙

```
YYYY-MM-DD-제목.md
```

예시:
- `2026-01-28-삼성전자-분석.md`
- `2026-01-28-apple-analysis.md`

---

## 📁 폴더 구조

```
research/
├── _config.yml          # 사이트 설정
├── _posts/              # 발행된 글
├── _drafts/             # 초안 (템플릿 포함)
│   ├── TEMPLATE-korea.md
│   └── TEMPLATE-usa.md
├── about.md             # 소개 페이지
├── index.md             # 홈페이지
└── .github/workflows/   # 자동 배포 설정
```

---

## 🔄 작업 흐름

```
글 작성 → git add → git commit → git push → 자동 배포!
```

```bash
# 새 글 발행
git add _posts/2026-01-28-새글.md
git commit -m "Add: 삼성전자 분석"
git push
```

---

## 🏷️ 태그 가이드

### 카테고리
- `korea` - 한국 기업
- `usa` - 미국 기업
- `general` - 일반 글

### 추천 태그
- 산업: `반도체`, `IT`, `금융`, `바이오`, `소비재`
- 테마: `배당주`, `성장주`, `가치주`, `ESG`

---

## 📖 로컬에서 미리보기 (선택)

```bash
# Ruby 설치 후
bundle install
bundle exec jekyll serve

# http://localhost:4000 에서 확인
```

---

## ⚠️ 주의사항

- 모든 분석은 개인 학습 목적
- 투자 조언이 아님 (면책조항 필수)
- 저작권 있는 자료 인용 시 출처 명시
