class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.118/tierstore-0.3.118-macos-arm64.tar.gz"
      sha256 "063ef5c9af33f52a06ed4a766ddfd4ab2f38c27fa6091b8cc67658b2a1a3562f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.118/tierstore-0.3.118-linux-aarch64.tar.gz"
      sha256 "101611d64e6e97139d54ff965f8b3df9a25d59610e07fba87156165b5c89ad8a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.118/tierstore-0.3.118-linux-x86_64.tar.gz"
      sha256 "e864130f7207e990b8d33528c813eef1b90e8b57934464cc23cf1cefce978003"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
