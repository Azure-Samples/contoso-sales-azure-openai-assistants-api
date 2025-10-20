# Contoso Sales Assistant Built with the Azure OpenAI Assistant API and Chainlit

이 프로젝트는 Azure OpenAI Assistant API와 Chainlit을 사용하여 구축된 Contoso 영업 어시스턴트입니다. GPT-4o 모델을 활용하여 영업 데이터 분석 및 질의응답 서비스를 제공합니다.

## 🚀 빠른 시작 (Quick Start)

### GitHub Codespaces에서 배포

이 프로젝트는 GitHub Codespaces에서 원클릭 배포가 가능하도록 설정되어 있습니다.

1. **Codespaces 시작**: GitHub에서 "Code" → "Codespaces" → "Create codespace on main"
2. **자동 설정**: 개발 환경이 자동으로 설정됩니다 (Azure CLI, Azure Developer CLI, GitHub CLI 포함)
3. **Azure 배포**: 다음 명령어를 실행하세요:

```bash
./deploy-to-azure.sh
```

### 수동 배포

Codespaces가 아닌 환경에서 배포하는 경우:

```bash
# Azure CLI 로그인
az login --use-device-code

# Azure Developer CLI 로그인  
azd auth login --use-device-code

# 배포 실행
azd up
```

## 📋 배포 후 접속 정보

배포가 완료되면 다음과 같은 정보를 받게 됩니다:

- **🌐 애플리케이션 URL**: `https://[앱이름].azurecontainerapps.io/sales`
- **👤 사용자명**: `sales@contoso.com`  
- **🔑 비밀번호**: `password` (기본값 고정)

⚠️ **중요**: URL 끝에 `/sales` 경로를 반드시 포함해야 합니다.

## 🏗️ 아키텍처

이 솔루션은 다음 Azure 서비스를 사용합니다:

- **Azure OpenAI Service**: GPT-4o 모델로 AI 어시스턴트 제공
- **Azure Container Apps**: Python/Chainlit 애플리케이션 호스팅
- **Azure Container Registry**: 컨테이너 이미지 저장
- **Azure Log Analytics**: 로깅 및 모니터링
- **Azure Resource Group**: 리소스 관리

## 🛠️ 로컬 개발

### 필요 조건

- Python 3.12+
- Azure 구독
- Docker (선택사항)

### 환경 설정

1. **저장소 복제**:
```bash
git clone <repository-url>
cd contoso-sales-azure-openai-assistants-api
```

2. **Python 의존성 설치**:
```bash
pip install -r requirements-dev.txt
```

3. **환경 변수 설정**:
`.env` 파일을 생성하고 다음 변수들을 설정하세요:

```env
AZURE_OPENAI_ENDPOINT=your-openai-endpoint
AZURE_OPENAI_API_KEY=your-api-key
AZURE_OPENAI_API_VERSION=2024-05-01-preview
AZURE_OPENAI_DEPLOYMENT=gpt-4o
AZURE_OPENAI_ASSISTANT_ID=your-assistant-id
# ASSISTANT_PASSWORD는 기본값 "password" 사용
```

4. **로컬 실행**:
```bash
cd src
chainlit run app.py
```

## 📁 프로젝트 구조

```
├── .devcontainer/          # GitHub Codespaces 설정
│   ├── devcontainer.json   # 개발 컨테이너 구성
│   └── setup.sh           # 자동 설정 스크립트
├── infra/                  # Azure 인프라 (Bicep)
│   ├── main.bicep         # 메인 인프라 템플릿
│   └── main.parameters.json # 배포 파라미터
├── src/                    # 애플리케이션 소스 코드
│   ├── app.py             # Chainlit 애플리케이션
│   ├── main.py            # FastAPI 애플리케이션
│   └── sales_data.py      # 영업 데이터 처리
├── azure.yaml             # Azure Developer CLI 설정
├── deploy-to-azure.sh     # 원클릭 배포 스크립트
└── README.md              # 이 파일
```

## 🔧 설정 및 사용자 정의

### 환경 변수

배포 시 다음 환경 변수들이 자동으로 설정됩니다:

- `CHAINLIT_AUTH_SECRET`: Chainlit 인증용 시크릿 (자동 생성)
- `LITERAL_API_KEY`: Literal AI API 키 (자동 생성)
- `ASSISTANT_PASSWORD`: 애플리케이션 접속 비밀번호 (기본값: `password`)

### 사용자 정의

1. **AI 어시스턴트 설정**: `src/instructions.txt` 파일을 수정하여 어시스턴트 동작을 변경
2. **데이터베이스**: `src/database/` 폴더의 SQLite 데이터베이스 및 스키마 수정
3. **UI 커스터마이징**: `public/` 폴더의 로고 및 스타일 파일 수정

## 🚨 문제 해결

### 일반적인 문제

1. **"Not Found" 오류**: URL 끝에 `/sales` 경로가 포함되었는지 확인
2. **로그인 실패**: 사용자명이 `sales@contoso.com`이고 올바른 비밀번호를 사용하는지 확인
3. **배포 실패**: Azure 구독 권한과 리전 할당량을 확인

### 로그 확인

Azure Portal에서 Container Apps의 로그를 확인하거나 다음 명령어를 사용:

```bash
# 애플리케이션 로그 확인
azd logs

# Azure CLI로 로그 확인  
az containerapp logs show --name <app-name> --resource-group <resource-group>
```

## 📖 추가 문서

자세한 문서는 다음에서 확인할 수 있습니다:
[Contoso Sales Assistant 문서](https://azure-samples.github.io/contoso-sales-azure-openai-assistants-api/)

## 📄 라이센스

이 프로젝트는 MIT 라이센스 하에 있습니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.
