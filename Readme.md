# AzWebAppSandbox

---
## Codeデプロイ
    Pythonのサンプルコードをデプロイする

## WebAppsSetting
     - サブスクリンプション: 従量課金
     - リソースグループ: WebAppsTest
     - 名前: SListSandboxApp.azurewebsites.net
     - 公開: コード
     - ランタイムスタック: Python 3.7
     - オペレーティングシステム: Linux
     - 地域: Japan East
     - Linuxプラン ASP-WebAppsTest-b502
     - Free F1 


## サンプルコード
    [Azure App Service on Linux で Python アプリを作成する](https://docs.microsoft.com/ja-jp/azure/app-service/quickstart-python?tabs=bash)  
    [Azure App Service 向けの Linux Python アプリを構成する]https://docs.microsoft.com/ja-jp/azure/app-service/configure-language-python#container-startup-process
    サンプルコードを"git clone"して利用する  
        git clone https://github.com/Azure-Samples/python-docs-hello-world

## Gitデプロイ作業
    1. Azure デプロイセンターでリポジトリを追加 Kuduを使用
    2. ローカルマシンのリポジトリに、リモートリポジトリとして追加 
        git remote add {RepoName} {URL}
        git remote -v
    3. pull実行 (--set-upstream で固定push/pullリポジトリ指定)
        git pull {RepoName} master
    4. Azure上のリポジトリにプッシュ
        git push {RepoName} master  
    * 同一リポジトリを流用する場合が -f で強制プッシュする等
    * リポジトリを統合する場合　--allow-unrelated-histories

### gitリポジトリの作成
    git init
    git add .
    git commit -am "Init commit"

## 動作確認
    概要蘭のエンドポイントに対してアクセスする。

---
## Dockerデプロイ
    Dockerコンテナでデプロイする

## Azureコンテナレジストリ
    Azureコンテナーレジストリ を作成
    - サブスクリンプション: 従量課金
    - リソースグループ: WebAppsTes
    - レジストリ名: {RegName}
    - 場所: 東日本
    - SKU: Basic

1. コンテナーレジストリ管理画面 > アクセスキーにアクセス  
　　管理ユーザを有効化し、 ユーザ名とパスワードを取得する
2. デプロイ完了後にレジストリにログイン(小文字でレポジトリ名を指定)
    docker login {RegName}.azurecr.io
    発行されたユーザ名とパスワードでログインする
3. dockerコンテナをビルドする(.yml拡張子にする)
    docker-compose build --no-cache
4. タグ付をする(小文字でレポジトリ名を指定)
    docker tag unitpy_api {RegName}.azurecr.io/unitpy_api
5. プッシュする(小文字でレポジトリ名を指定)
    docker push {RegName}.azurecr.io/unitpy_api


## WebAppsSetting
     - サブスクリンプション: 従量課金
     - リソースグループ: WebAppsTest
     - 名前: SLSandboxDocker.azurewebsites.net
     - 公開: Dockerコンテナ
     - オペレーティングシステム: Linux
     - 地域: Japan East
     - Linuxプラン ASP-WebAppsTest-b502
     - Free F1 
### Docker
     - オプション: Docker-compose
     - イメージソース: Azure Container Registry
     - レジストリ: {RegName}
     - 構成ファイル: docker-compose.yml (.yml拡張子にする)

### 設定
    コンテナの設定からログを確認する