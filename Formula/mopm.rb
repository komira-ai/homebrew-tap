class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.89/mopm-0.0.89-macos-arm64.tar.gz"
      sha256 "27ef9d61fd0e78c8d88aaf4f5c6040c11a0897b19b70d3b2dbcda0124bfe5163"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.89/mopm-0.0.89-linux-aarch64.tar.gz"
      sha256 "a2800738fbc5f2b39fe9f8c6fd59919d4cfb0907502c0325decc5dee9f1bc0e4"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.89/mopm-0.0.89-linux-x86_64.tar.gz"
      sha256 "fce7cd2505ac52335efb72abdf780cdca503257b250c28c388317139064243a8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
