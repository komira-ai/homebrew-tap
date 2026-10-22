class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.22/mopm-0.0.22-macos-arm64.tar.gz"
      sha256 "44392b6765b54d4741f6a237106c62d47a233c14b87fa791e8a184b973469a8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.22/mopm-0.0.22-linux-aarch64.tar.gz"
      sha256 "88ec1dc4382f72de42d83713c4d024a9f6436e458c9cec57c37d3b21451af559"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.22/mopm-0.0.22-linux-x86_64.tar.gz"
      sha256 "61c7b227dca7d9cc5bc471bea6354146fdc2364878e98ec74179e90dd70eaf5c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
