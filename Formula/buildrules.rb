class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.27/buildrules-cli-0.0.27-macos-arm64.tar.gz"
      sha256 "eda37413a1ecaf8d1ed119b74d4b79374195d3ab59d1bf39ab8c3f5f3beb3885"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.27/buildrules-cli-0.0.27-linux-aarch64.tar.gz"
      sha256 "cc4c29f39bb09171b93d50ad2bdd255eac901fa360b4ca67b268d9eba4ad61cb"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.27/buildrules-cli-0.0.27-linux-x86_64.tar.gz"
      sha256 "51612481401a0f5e83ac542910431d1d4ad7cb7b94199fb37ea8276ae4e07273"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
