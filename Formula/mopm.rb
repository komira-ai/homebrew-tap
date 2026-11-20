class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.130/mopm-0.0.130-macos-arm64.tar.gz"
      sha256 "78efe44a20f348c63bd29ecc1a7409b9329ed94fc243fd05e0cb358d6e7aab6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.130/mopm-0.0.130-linux-aarch64.tar.gz"
      sha256 "2f5842e73107644d855a0d4557fb354021bf690b23072f0844cd155c1d779c88"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.130/mopm-0.0.130-linux-x86_64.tar.gz"
      sha256 "a819329e79f7be84af52f7145d843a7697be28824a12f5d9531480368a879d30"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
