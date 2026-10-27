class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.80/mopm-0.0.80-macos-arm64.tar.gz"
      sha256 "1e146d4544abc1dde32c990ef05e3623143fd870fed181d008d8823dbfca81f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.80/mopm-0.0.80-linux-aarch64.tar.gz"
      sha256 "5e067abc5adc9062bbbc4704c7e3c40e3d697936229e210fb0d74fb2f2f67081"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.80/mopm-0.0.80-linux-x86_64.tar.gz"
      sha256 "9bfa53f4b2854ae43e3d4b7587e9a860f6e38ed0526acecde79c2d2c3d4aca7d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
