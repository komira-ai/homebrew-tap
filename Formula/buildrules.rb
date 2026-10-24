class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.36/buildrules-cli-0.0.36-macos-arm64.tar.gz"
      sha256 "74dca6e76df0e9d0c0e2bea91a8575bef70dce2afe75fab7114c797e7d628773"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.36/buildrules-cli-0.0.36-linux-aarch64.tar.gz"
      sha256 "d703ba2f1a823f9968bad938a2ef44379b1d0b1c6352cbf6ea8c5daf6d9600e1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.36/buildrules-cli-0.0.36-linux-x86_64.tar.gz"
      sha256 "1a5d48f0c524ead8e6bd51d5a91ac3e699bd21c67748b4c941644298c34b888e"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
