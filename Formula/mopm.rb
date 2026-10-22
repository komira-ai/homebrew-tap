class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.24/mopm-0.0.24-macos-arm64.tar.gz"
      sha256 "cad84c23afa9947746c3196fb8599794ae7533655a1795c8fdc58627885514b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.24/mopm-0.0.24-linux-aarch64.tar.gz"
      sha256 "17613123f82f4da20daf991b550829734bd8242460761e58522449fdf800f568"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.24/mopm-0.0.24-linux-x86_64.tar.gz"
      sha256 "1ded65259851ff7a6751e98005d14d9014aeb5e64fb3966b2ec5f0c7179fd5b1"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
