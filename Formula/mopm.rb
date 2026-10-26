class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.71/mopm-0.0.71-macos-arm64.tar.gz"
      sha256 "a8f66127c8b8b796f161a77bd2564add95b5d91b899181313007cb7686a1c69a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.71/mopm-0.0.71-linux-aarch64.tar.gz"
      sha256 "a40c92fc9b7d302f48f47e0ba1d53aa2c1f2389892613e56fa12f4595422c524"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.71/mopm-0.0.71-linux-x86_64.tar.gz"
      sha256 "287acc832e3440b23857c6b1916b761e8a19f113af5470c1576d7c3a1a7e656d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
