class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.54/buildrules-cli-0.0.54-macos-arm64.tar.gz"
      sha256 "fa8ce43e55c8bc3712ef32061bb42bf7b7a5100b22bb2f66169472ca535c79a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.54/buildrules-cli-0.0.54-linux-aarch64.tar.gz"
      sha256 "03ad94b7c0d70dce3b85022646d400e44b34066a6e6a0d769c1ecb44d12a827e"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.54/buildrules-cli-0.0.54-linux-x86_64.tar.gz"
      sha256 "d273cc7de6f5860edf1f0b6acafd99cdcc09a61ec3b86f03a39bf9923f3b0bd8"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
