class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.64/mopm-0.0.64-macos-arm64.tar.gz"
      sha256 "e95e0126239bf6b7b01a408ae88aa6b1c5f4ecfbe65421122ec5f8ba1496154c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.64/mopm-0.0.64-linux-aarch64.tar.gz"
      sha256 "a178e3af453e5dd619952a96d30d5e1570a0fa904cada8e86ab731b6f14290de"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.64/mopm-0.0.64-linux-x86_64.tar.gz"
      sha256 "51c55f3e17a058cc7e6b32384a576848dc4e367767d2b17aef4ad4f95f545cfa"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
