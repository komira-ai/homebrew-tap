class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.26/mopm-0.0.26-macos-arm64.tar.gz"
      sha256 "bde9427f106620a92852dc916457d5b2d5fd589b1cf0c8d6ff3cd44f05958727"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.26/mopm-0.0.26-linux-aarch64.tar.gz"
      sha256 "b1b162cb7c3469f04b30d5a870bf463a0d7f88e8aa332514852eb261e7a68fbe"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.26/mopm-0.0.26-linux-x86_64.tar.gz"
      sha256 "22c42da46b3583590f5bc9253bb862d23e11f147d36f6c3e60e62db8c54b10fe"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
