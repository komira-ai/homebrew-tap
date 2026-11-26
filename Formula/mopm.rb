class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.143/mopm-0.0.143-macos-arm64.tar.gz"
      sha256 "a145a3d4d878f30b3883a368eb82b9461dfd932f01803ebb5ca849c26efeaf59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.143/mopm-0.0.143-linux-aarch64.tar.gz"
      sha256 "cbe68ab54f45b6868999cce7f182ef3d2c08c30322fcbe6713e0ccc5816e9b36"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.143/mopm-0.0.143-linux-x86_64.tar.gz"
      sha256 "dc7d31e8fa51181e383cac581b4b9a4bec6c0c61df99a2b75e403590d6650c0e"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
