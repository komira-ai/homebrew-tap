class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.81/mopm-0.0.81-macos-arm64.tar.gz"
      sha256 "26955e36948fa10ee38baf5d3ce2873058c4e33201e9eb8cff1709bbfce58985"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.81/mopm-0.0.81-linux-aarch64.tar.gz"
      sha256 "7cba13c4f348ae862d95a1bbe07167210de10ca8ac1abbebcd2bb7954cc54cfe"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.81/mopm-0.0.81-linux-x86_64.tar.gz"
      sha256 "7113f0526235e6aa301308da05c3fe1223ae068ae4627d83b0849e465f5a185c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
