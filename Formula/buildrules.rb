class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.49/buildrules-cli-0.0.49-macos-arm64.tar.gz"
      sha256 "ce04298493ab8bac182f33497d0a5ceeb45bf457a68d4df4185cd0f365683f17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.49/buildrules-cli-0.0.49-linux-aarch64.tar.gz"
      sha256 "53459c54513da132a113652ead7861b008359f0bfb435b2bfb9d4ba3772d3cb5"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.49/buildrules-cli-0.0.49-linux-x86_64.tar.gz"
      sha256 "622744d54cc6e2c6243a9fc0eb8d64ed78948df156f10ff6506b6bac63fa64ea"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
