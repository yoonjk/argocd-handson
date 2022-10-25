## Top 10 Argo Workflows Examples
우리는 모두 Argo 워크 플로가 Kubernetes에서 평행 작업을 쉽게 조정할 수있는 방법을 알고 있습니다. 데이터 처리 및 ETL 프로젝트와 가장 관련이 있지만 훨씬 더 유용합니다! 이 10 개의 워크 플로우는이 Kubernetes 오케스트레이터를 보는 방식을 바꿀 것입니다. 

다이빙합시다!

ARGO는 YAML 파일에 저장된 사용자 정의 리소스 정의를 사용하여 배포를 관리합니다. 따라서 인프라를 관리하기 위해 새로운 사양을 배울 필요가 없습니다. Kubernetes 및 Kustomize 스크립트에 사용 된 것과 동일한 패턴을 따라 일관성을 유지하는 데 도움이됩니다.

아래에서는 워크 플로에서 매개 변수를 사용하는 방법을 볼 수 있으며 구성이 런타임 값을 사용하면 전달 매개 변수가 편리합니다. 결과적으로 액세스 토큰과 같은 구성 요소를 작성한 후에 만 ​​일부 구성 요소를 알 수 있습니다.

01-parameters.yaml

우리 템플릿에서 매개변수 메시지의 기본값은 메시지 문자열 기본값입니다. 그러나 아래 명령을 실행하여 볼 수 있듯이 이 값은 런타임에 덮어쓸 수 있습니다.
```bash
argo submit --watch 01-parameters.yaml -n argo -p message="This ran from your container"
```
Argo Workflows Logs UI의 출력을 검증할 수 있습니다. (클러스터를 생성하는 동안 포트 포워딩 지침을 빠르게 따르면 https://localhost:2746/에서 기본적으로 UI에 액세스할 수 있습니다.)

02-docker-registry-secret.yaml

보안 저장소에서 이미지를 pull
생태계를 자동화 할 때 좋아하는 기능 중 하나는 서비스의 액세스를 관리하는 관련 액세스 키를 사용하는 것입니다. 이는 회사내 private 컨테이너 저장소를 사용하여 컨테이너 이미지를 호스팅하는 경우 유용합니다. Argo Workflows는 Kubernetes 비밀의 기본 지원으로 이를 달성하는 데 도움이됩니다.

03-sidecar-nginx.yaml

내가 가장 좋아하는 일 중 하나는 포드를 시작하는 동안 사이드카를 사용하는 것입니다. Kubernetes 사이드카는 반복되는 작업을 처리 할 수있는 유용한 도우미입니다. 결과적으로 NGINX의 리버스 프록시 사이드카 인스턴스를 배포

04-archivelogs.yaml

현재 워크 플로 상태를 지속적으로 보관
Workflow Archive는 Argo Workflows가 제공하는 훌륭한 기능으로, 이전 워크 플로 상태가 관계형 데이터베이스에 저장 될 수 있습니다 (현재 Postgres 또는 MySQL). 그러나 Argo의 아카이브는 자세한 실행 로그를 유지하지 않습니다. Minio와 같은 아티팩트 저장소를 구성해야합니다.
아카이브 기능을 사용하려면 먼저 Argo Server의 영구 저장소 옵션을 구성해야합니다
환경이 구성되면 아래에 표시된대로 워크 플로를 Spec.archivelocation.archivelogs로 저장할 수 있습니다

05-input-artiffact-git.yaml

Argo Workflows가 외부로 제공하는 또 다른 멋진 기능은 추가 사이드카 또는 초기 컨테이너없이 GIT 저장소를 동기화 할 수 있다는 것입니다.

06-dag-target.yaml
DAG(Directed Acyclic Graph) 워크플로 생성
DAG (Directed Acyclic Graph)가 이제 Apache Spark의 데이터 처리 워크로드 step의 인상적으로 처리하는 방법과 Apache Airflow의 일반적인 데이터 오케스트레이션 패턴으로의 사용하는 것 때문에 분석 도메인에 대한 관심을 받고 있다고 생각합니다.
ARGO 워크 플로우를 사용하면 airflow 의 Kubernetes Executor를 구성 하는것 대신 Kubernetes 친화적인 인터페이스가 있습니다.

ARGO 워크 플로우는 지정한 워크 플로를 지정한 것만 실행합니다. 그러나 정보에 입각 한 대상에 도달 할 때까지 각 종속성을 실행합니다. 아래 target이 B E이면 대상 D 만 건너뜁니다
```
argo submit --log 06-dag-target.yaml -n argo -p target="E"
argo submit --log 06-dag-target.yaml -n argo -p target="D"

argo submit --log 06-dag-targets.yml -n argo -p target="B E" 
```
07-python-random-no-gen.yaml

컨테이너는 이미 런타임 환경을 쉽게 관리 할 수 ​​있습니다. 따라서 파이썬 기반 워크 플로우 단계에 필요한 라이브러리와 버전이있는 파이썬 컨테이너를 쉽게 빌드 할 수 있습니다.

ARGO 워크 플로를 사용하면 이름으로 컨테이너에 이미 설치된 Python 스크립트를 호출하거나 워크플로우 설명의 소스 필드를 통해 코드로 전달할 수 있습니다. 소스 블록에 유효한 코드를 지정할 수 있습니다.

08-retry.yaml
때로는 여러 대상이 재시도로 로직을 구현할 수 있으며 ARGO 워크 플로우는 워크플로 수준에서 재시도 전략을 구성합니다.


조건부 워크 플로는 구현하기가 매우 간단합니다. 이전 단계의 반환 상태를 기반으로 아키텍처를 배포 할 수 있습니다.이 단계는 컨테이너 세트를 조정할 때 매우 편리합니다.