class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.53/mopm-0.0.53-macos-arm64.tar.gz"
      sha256 "7e88852e0a56b55369b4a02b53574217813538cdc2759d239173bc4acd413aee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.53/mopm-0.0.53-linux-aarch64.tar.gz"
      sha256 "dabbb32ce9054b75be3fc6cbf90c0519bc5e73d8003939e7de1dfa1587a190db"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.53/mopm-0.0.53-linux-x86_64.tar.gz"
      sha256 "bfbf2dd82ccdf405577178ba08ce37e3048096bb6cee8800305ac3b2a11d5629"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
