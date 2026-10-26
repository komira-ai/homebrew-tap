class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.73/mopm-0.0.73-macos-arm64.tar.gz"
      sha256 "2cf41ad9368186b30e40d2d690910eb9c3e33b167c22f730a779b16b8ff85ddb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.73/mopm-0.0.73-linux-aarch64.tar.gz"
      sha256 "ef8ee9457d792c8fc4155ea04fcd0699d44834cb08d54fe0e72c7e9cbd5327c2"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.73/mopm-0.0.73-linux-x86_64.tar.gz"
      sha256 "02d4d8d8328f3a996cef137596bab2421575312fc84e22491f2d813e24ff728b"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
