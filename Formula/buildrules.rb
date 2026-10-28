class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.64/buildrules-cli-0.0.64-macos-arm64.tar.gz"
      sha256 "1ab6566e052cfa611da9d98c30a97b1ab9691cccefcbad7ed46774a4c63a949f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.64/buildrules-cli-0.0.64-linux-aarch64.tar.gz"
      sha256 "3e2e72759420a0eda5a51b71fc768e30848320f3da772b70267197d2c4853870"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.64/buildrules-cli-0.0.64-linux-x86_64.tar.gz"
      sha256 "3465dfd6d15931b5edbef777d98ba9444602e3857e9bd6c8791e7e233b5b67ec"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
