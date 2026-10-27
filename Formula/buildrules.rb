class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.53/buildrules-cli-0.0.53-macos-arm64.tar.gz"
      sha256 "f44df1af1bf980720f124c001c27c11c2e5a15e9ddb378a561629f2a712e5b06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.53/buildrules-cli-0.0.53-linux-aarch64.tar.gz"
      sha256 "2ae3b8dbae198ac5614b520108df35c29290a5f43271b44171cda4b4e5a73585"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.53/buildrules-cli-0.0.53-linux-x86_64.tar.gz"
      sha256 "b748b54e2a03cdfbf14ed6e4e93764b52f5a2eff6277fbe80c329f8f438ddbb8"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
