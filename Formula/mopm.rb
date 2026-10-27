class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.77/mopm-0.0.77-macos-arm64.tar.gz"
      sha256 "299d5267a9ca06f07e47af064c4967d44c759495de790b7c812b3db150ead121"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.77/mopm-0.0.77-linux-aarch64.tar.gz"
      sha256 "4e21bc11bed934f8bdbf106fafcdc7489df3b7d771b8a0b4f6ca02fda5c13cb6"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.77/mopm-0.0.77-linux-x86_64.tar.gz"
      sha256 "cbb10d37fc1d2ee1dbd3ba242abee3ed75aa3752b8d417f3a345eabe6aefa030"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
