class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.133/mopm-0.0.133-macos-arm64.tar.gz"
      sha256 "5c511ffc65e987c026642499d079da1678eddacad01f71f6830035d37729f614"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.133/mopm-0.0.133-linux-aarch64.tar.gz"
      sha256 "e3c8494ba6f7b241994845842a64003e4c222ea300cf467926ebc4746f50964b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.133/mopm-0.0.133-linux-x86_64.tar.gz"
      sha256 "09d4265cbc8300d21bf45805a47d31cf1a662a4cbc20e1ae292ddeeae4affd49"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
