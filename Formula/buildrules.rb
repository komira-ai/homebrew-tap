class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.84/buildrules-cli-0.0.84-macos-arm64.tar.gz"
      sha256 "cadfbfb7b5397e85e687844c1e47f2377173c3207c1ed57944b91b5f1ba197d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.84/buildrules-cli-0.0.84-linux-aarch64.tar.gz"
      sha256 "b185c75916d53e895777aa10e3cfd9d4e60fc3f51e67c534ed92c88a12d2f937"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.84/buildrules-cli-0.0.84-linux-x86_64.tar.gz"
      sha256 "da6f5725c4c260b0f52f26db3aaae9a05263fd79611f91a5c52e67053b4fef85"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
