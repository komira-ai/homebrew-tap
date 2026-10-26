class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.48/buildrules-cli-0.0.48-macos-arm64.tar.gz"
      sha256 "6dad0a82956b2b57709666afaf9c946114f229fa3a4c12bac53fb3cdcba855c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.48/buildrules-cli-0.0.48-linux-aarch64.tar.gz"
      sha256 "bf6f9fced98d649c92608f00b448264ac877855c47b7efdf64ad0392a29dff1d"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.48/buildrules-cli-0.0.48-linux-x86_64.tar.gz"
      sha256 "98d1ea2a59501f764ab9e63c4a1a1896267e3cf295cfe497f6cef9fc7d842fff"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
