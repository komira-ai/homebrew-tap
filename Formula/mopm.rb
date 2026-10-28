class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.92/mopm-0.0.92-macos-arm64.tar.gz"
      sha256 "6ef49d279423a1d7bbe835558927404ef604a334bd435501e663ed8972a8c846"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.92/mopm-0.0.92-linux-aarch64.tar.gz"
      sha256 "e069470dde0d4669e90c2db895ff65b280fbe5806dd7c0ebf43deb3540f0e7a6"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.92/mopm-0.0.92-linux-x86_64.tar.gz"
      sha256 "ed60e7b6b693fe4ef896e4fedd04e4db373bb8f4d94c88371371102faa3306da"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
