class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.47/mopm-0.0.47-macos-arm64.tar.gz"
      sha256 "ef79b50bbb78626a6cd85906fe5e748da02ef107b5250b097804bd6fc63783eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.47/mopm-0.0.47-linux-aarch64.tar.gz"
      sha256 "b0c47a8d403259bbceb91865154e231afab717633d190d510f9001f4306b1b22"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.47/mopm-0.0.47-linux-x86_64.tar.gz"
      sha256 "9c73ecf06c5f3e8333bdb9457098cf6b32690f3332f9dcb59b2e3c1238a14518"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
