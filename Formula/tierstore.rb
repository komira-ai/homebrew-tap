class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.167/tierstore-0.3.167-macos-arm64.tar.gz"
      sha256 "da17fda8d2d43f8bc9598c640c98de07a505a02a2966a54e2de3a5a12444d367"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.167/tierstore-0.3.167-linux-aarch64.tar.gz"
      sha256 "3aae0b0d7b7aa2ba7866533bc6a972d5ce19a8da349e62aecc74afa6dd6140df"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.167/tierstore-0.3.167-linux-x86_64.tar.gz"
      sha256 "eaa92daa8e2305ba7ee580e144e3f5d498592862c64cadfdaf3fdf066fbbf221"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
