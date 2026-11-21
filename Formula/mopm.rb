class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.135/mopm-0.0.135-macos-arm64.tar.gz"
      sha256 "aa6f654519476d749a357fd03f39604dbabc51169cbfb6b389ddb99ba9bbd1ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.135/mopm-0.0.135-linux-aarch64.tar.gz"
      sha256 "d8c494e86ae6c77857fbfbf0cee84193e27498fe0c6dcb057b35f29a2100926d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.135/mopm-0.0.135-linux-x86_64.tar.gz"
      sha256 "8592b603cdd224f9cabded0ed53cd2ab7a1aea5460ff1b8c7611286b54e3f23d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
