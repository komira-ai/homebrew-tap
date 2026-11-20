class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.122/mopm-0.0.122-macos-arm64.tar.gz"
      sha256 "c451f6adbb8ccc3c6bf78cf168eb7c55b1d0e7036552a7d9cc2451b1c40bdbe8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.122/mopm-0.0.122-linux-aarch64.tar.gz"
      sha256 "30c77411c7746cfe5a5148de49670c690e8927bb5718497eeb920dbc507ab50b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.122/mopm-0.0.122-linux-x86_64.tar.gz"
      sha256 "e4606ea5e8f6021d672b035bc6cb5c441ff88b294f410da41e6da2aa52b6e1fd"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
