class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.97/mopm-0.0.97-macos-arm64.tar.gz"
      sha256 "551ff8007a3a70a6446b1de0fad09b4b90d79c27084423863ffdcc3773963644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.97/mopm-0.0.97-linux-aarch64.tar.gz"
      sha256 "c4a983775a7a59d92a323b93711a4fd6428f84fc2472e7f469e01c865acfea6f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.97/mopm-0.0.97-linux-x86_64.tar.gz"
      sha256 "ad590427bfadf436d24397614b58970461997eadcea9d5a154e79a30b4cce708"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
