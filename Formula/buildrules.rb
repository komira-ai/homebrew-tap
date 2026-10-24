class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.35/buildrules-cli-0.0.35-macos-arm64.tar.gz"
      sha256 "1dfbe73ed7761efa3c62f51af0403d605b0d9d3aa7094618d88091349fd3bb08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.35/buildrules-cli-0.0.35-linux-aarch64.tar.gz"
      sha256 "0f46522a547f8afe7c6e171d8d8bcc851a90c90a900a8cb3e794d26f0e3a6f2f"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.35/buildrules-cli-0.0.35-linux-x86_64.tar.gz"
      sha256 "29c7b6a51842462154d2d7f86094e908f6f46fd1a85c227616be26ac720aff2b"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
