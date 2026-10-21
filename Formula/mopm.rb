class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.10/mopm-0.0.10-macos-arm64.tar.gz"
      sha256 "331b65d455207076b14f7cc94a8aaa4a4cf48dbcb78ea44592f73b738113408f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.10/mopm-0.0.10-linux-aarch64.tar.gz"
      sha256 "722c062574adac824a6be9066f9661419692bce5f4f19e517bb380fe5f629a0d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.10/mopm-0.0.10-linux-x86_64.tar.gz"
      sha256 "252e8a5d79f177944d15a4ffb790c07307b2e52879e9f8cc4699f324215cfff3"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
