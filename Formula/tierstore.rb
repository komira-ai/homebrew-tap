class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.126/tierstore-0.3.126-macos-arm64.tar.gz"
      sha256 "edc9f772b5d5d21f1db6a8720ed3453d91b647e92b2b360e903f9b8f0b11ec21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.126/tierstore-0.3.126-linux-aarch64.tar.gz"
      sha256 "c6e7aacdd2d1eb8cd785e9eaf1e7bb8d8e29c3d8337b734275a0cf184fca8120"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.126/tierstore-0.3.126-linux-x86_64.tar.gz"
      sha256 "c2255cfe13d0ac8ad7c91a949ed0e09afb2d04f918128bf46f9114e41095b3c3"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
