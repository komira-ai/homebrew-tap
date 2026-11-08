class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.73/tierstore-0.3.73-macos-arm64.tar.gz"
      sha256 "d5b78cd6edab3bd4c06281f550532ce57e3ca9a418f175f904f2cff45dc036ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.73/tierstore-0.3.73-linux-aarch64.tar.gz"
      sha256 "b20009cf227e3a3fff16b9bb3158fd7bc55d32180b238b36833f57370754b334"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.73/tierstore-0.3.73-linux-x86_64.tar.gz"
      sha256 "4b1540ea1b21afafa17b9cf2d8ce19d864744e6f09b7f9b750b0bcbbe4c36eaa"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
