# Upgradable NFT

スマート コントラクトを更新できるようにした NFT 実装のサンプル コードです。`@openzeppelin/contracts-upgradeable` パッケージの `ERC721EnumerableUpgradeable` を利用しています。

## 動作方法

1. 適切なディレクトリでこのレポジトリをクローンし、ライブラリをダウンロードします。
```bash
git clone https://github.com/takeiyuto/upgradable-nft.git
cd upgradable-nft
yarn
```

2. コンパイルします。
```bash
yarn truffle compile
```

3. 新しいターミナルを開いて、同じディレクトリから、ローカル環境でテスト用ブロックチェーン Ganache を起動します。このとき、以下の `<MNEMONIC>` の箇所を、テストに用いるウォレット アカウントのニーモニックで置き換えて実行します。
```bash
yarn ganache -m "<MNEMONIC>"
```

4. 手順 2. のターミナルに戻って、デプロイします。`プロキシ コントラクトが 0x... にデプロイされました。` という表示によって、デプロイされたプロキシ コントラクトのアドレスが表示されます。また最後に `あとでこの行をコメントアウトします` というエラー表示が出て終了します。
```bash
yarn truffle migrate
```

5. さらに新しいターミナルを開いて、適切なディレクトリで[フロントエンドのレポジトリ](https://github.com/takeiyuto/hello-nft-web)をクローンし、ライブラリをダウンロードします。もし既にクローン済みである場合は、`git checkout upgradable` コマンドでブランチを切り替えてください。
```bash
git clone -b upgradable https://github.com/takeiyuto/hello-nft-web.git
cd hello-nft-web
yarn
```

6. 手順 5. と同じターミナル上で、ローカル Web サーバを起動して、フロントエンドを開始します。
```bash
yarn http-server .
```

7. MetaMask などのソフトウェア ウォレットが入ったブラウザで、http://127.0.0.1:8080/ を開きます。フロントエンドの表示に従って、手順 4. で確認したプロキシ コントラクトのアドレスを入力すると、**コントラクトのバージョンが 1 であること**を確認できます。

8. コントラクトをアップグレードするために、`migrations` フォルダ内の [3_version_2_deploy.js](./migrations/3_version_2_deploy.js) の、以下の行をコメントアウトします。
```js
throw "あとでこの行をコメントアウトします";
```

9. 手順 4. と同じターミナルに戻り、デプロイします。`アップグレードが完了しました。` という表示が出ます。
```bash
yarn truffle migrate
```

10. 手順 7. と同じブラウザに戻ります。すると、同一のプロキシ アドレスを入力したまま、**コントラクトのバージョンが 2 であること**を確認できます。手順 7. の前後で NFT を発行していれば、それらも引き継がれていることが確認できます。

11. Ganache およびローカル Web サーバは、それぞれ Ctrl + C で終了できます。

## `npm`と`yarn`

`yarn` は `npm` と同様、Node.js 向けのパッケージ マネージャです。次のコマンドで、システム全体で使えるように、インストールできます (macOS や Linux では、システム ディレクトリに書き込む権限を得るため、先頭に `sudo` が必要になるかもしれません)。
```bash
npm install -g yarn
```

`yarn` を使わない場合、上記の手順を次のように読み替えると、`npm` でも同じように実行できます。
* 引数のない単独の `yarn` コマンドは `npm install` にする。
* それ以外の `yarn` コマンド (例えば `yarn truffle ...` など) は、`yarn` を `npx` に読み替える。

## ライセンス表示

このサンプル コードは、[MIT License](LICENSE)で提供しています。

# 参照

[徹底解説 NFTの理論と実践](https://www.ohmsha.co.jp/book/9784274230608/)の第5章3節を参照してください。[本書の Web サイト](https://takeiyuto.github.io/nft-book)も参考にしてください。
