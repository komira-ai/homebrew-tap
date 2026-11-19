class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.143/tierstore-0.3.143-macos-arm64.tar.gz"
      sha256 "319086b7e994f3fd9536b163073c681a00114418a81a8612d525b64da1c31e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.143/tierstore-0.3.143-linux-aarch64.tar.gz"
      sha256 "14db69a9013b7c5ef68fcaeb00ad6b9d19e4de66c0c1b9e70ab7e974584afb4c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.143/tierstore-0.3.143-linux-x86_64.tar.gz"
      sha256 "850b6e06915fca4fb6be1c09ce8e9863d4b9f101e7020a1789f29e2693b2d8c9"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
