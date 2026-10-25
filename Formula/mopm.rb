class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.56/mopm-0.0.56-macos-arm64.tar.gz"
      sha256 "a7196343de8c070f2560c997360f00f377bec073338c336e0474961bbc19733b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.56/mopm-0.0.56-linux-aarch64.tar.gz"
      sha256 "6451979b098dd3410702d8e0b5ee94d24d935b63c13dfd266d26b8047ad20419"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.56/mopm-0.0.56-linux-x86_64.tar.gz"
      sha256 "dee09e7c92f06ab15f67d44419acd21826ca2634f7c75eba383d2e078617a568"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
