class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.126/mopm-0.0.126-macos-arm64.tar.gz"
      sha256 "a6ea1b69faa9d3678c06cd8fd098a858b109f7ced387eb3de59f3d8d5d7fe286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.126/mopm-0.0.126-linux-aarch64.tar.gz"
      sha256 "a77b4a9953ccf49b5659c70e18b13765a96b63f427763dd4ed0ef6fb263a4eab"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.126/mopm-0.0.126-linux-x86_64.tar.gz"
      sha256 "f07c3e04bfcf6ccbba8cf3425bb51253a36ccc64936577bab4e2dab96b98cec7"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
