class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.120/tierstore-0.3.120-macos-arm64.tar.gz"
      sha256 "fa57e150a8a4364c9d88d51c2cd86700073c7fd93552d051b665df796824354e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.120/tierstore-0.3.120-linux-aarch64.tar.gz"
      sha256 "d93b35c9c71f1e6a6bf39257c2dbf380a3e9da8c9725e929fbccd01b3f1d0ac6"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.120/tierstore-0.3.120-linux-x86_64.tar.gz"
      sha256 "16ed5daa4a44f623148fc404a723bd73964e16029a2f36b7e537c690a0cf66c0"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
