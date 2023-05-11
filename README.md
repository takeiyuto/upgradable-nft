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

4. 手順 2. のターミナルに戻って、デプロイします。出力中には、*Contract created* などとして、デプロイされたスマート コントラクトのアドレスが表示されます。
```bash
yarn truffle migrate
```

5. さらに新しいターミナルを開いて、適切なディレクトリで[フロントエンドのレポジトリ](https://github.com/takeiyuto/hello-nft-web)をクローンし、ライブラリをダウンロードします。
```bash
git clone https://github.com/takeiyuto/hello-nft-web.git
cd hello-nft-web
yarn
```

6. 手順 5. と同じターミナル上で、ローカル Web サーバを起動して、フロントエンドを開始します。
```bash
yarn http-server .
```

7. MetaMask などのソフトウェア ウォレットが入ったブラウザで、http://127.0.0.1:8080/ を開きます。フロントエンドの表示どおりで、現在の NFT の保有数を確認することができます。

8. ウォレットから、手順 4. のコントラクト アドレスに対して ether を送付します。すると、送付した ether 数量に関わらず、1 つのトークンが付与されます。フロントエンド上で保有数を再び確認すると、変化していることがわかります。

9. Ganache およびローカル Web サーバは、それぞれ Ctrl + C で終了できます。

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
