class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.85/mopm-0.0.85-macos-arm64.tar.gz"
      sha256 "d9e3ce9b40e9301bbf33f4ff0cc2f0a7bcabe52ac05c7e8a5d045a1f3e09b15f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.85/mopm-0.0.85-linux-aarch64.tar.gz"
      sha256 "59515f974676e91d017e2c86d2971a97eb1f6fec296ca1aed42538400ca37e68"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.85/mopm-0.0.85-linux-x86_64.tar.gz"
      sha256 "e0f9da8a9a5be4cb6a0260517911aa44da727bbd27c2f7a2a96458b4f0779c03"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
