class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.146/mopm-0.0.146-macos-arm64.tar.gz"
      sha256 "3a8175ea88b2d2e58c9d595ee28365779a785de1161af8b36d4c187ca5356ff7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.146/mopm-0.0.146-linux-aarch64.tar.gz"
      sha256 "8320d3d17d3d08f5b4d8ba747eb0d53775d39cab52c11f91521a59bc5dd149a7"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.146/mopm-0.0.146-linux-x86_64.tar.gz"
      sha256 "643cd8ff4642436c39f09bc828dce8dc6f535e4f9731ace3dcbd5ec6bcc0e1b0"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
