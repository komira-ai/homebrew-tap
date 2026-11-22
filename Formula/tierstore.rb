class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.162/tierstore-0.3.162-macos-arm64.tar.gz"
      sha256 "52a24f6cefe090be397eb40676d1724ad0c574ddb6a59d1cbdecc2c6785cb9cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.162/tierstore-0.3.162-linux-aarch64.tar.gz"
      sha256 "1aa5f396b49d42e8e34e81d0bc0136b403ac5e0a64dad3bb0fb48bbdc370c8e4"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.162/tierstore-0.3.162-linux-x86_64.tar.gz"
      sha256 "488f796c79d684334b67cd256f2fc67b987c125cf68d855d405b28a035fd0f4d"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
