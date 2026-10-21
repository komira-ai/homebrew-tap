class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.18/mopm-0.0.18-macos-arm64.tar.gz"
      sha256 "ad40136e64ad840f25d1d9957e631a42158051065ac71bc3dc009d926faec244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.18/mopm-0.0.18-linux-aarch64.tar.gz"
      sha256 "ef79d215b21bb993576e6211cfd75bd33deb2693b55a596b4afcebd532abcbe4"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.18/mopm-0.0.18-linux-x86_64.tar.gz"
      sha256 "c589d6d4d5e89567a8d8c9951348a78431d8c756687f2d9a91faf3f8846769df"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
