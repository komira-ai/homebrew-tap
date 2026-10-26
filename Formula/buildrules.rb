class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.51/buildrules-cli-0.0.51-macos-arm64.tar.gz"
      sha256 "44d6c3c5400981960dcde7647f00c45176f69bdef953d0d0d9cc5bcb9fba1503"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.51/buildrules-cli-0.0.51-linux-aarch64.tar.gz"
      sha256 "0bd6bc8a5a6c2bec09ff360341190e26c092e178a0eb8e6d07697b8e4ee36c58"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.51/buildrules-cli-0.0.51-linux-x86_64.tar.gz"
      sha256 "34cbecd093f5b9a01eb10612d8e596527d0379ff7f973d67f2be570c4b847b1e"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
