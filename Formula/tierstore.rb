class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.210/tierstore-0.3.210-macos-arm64.tar.gz"
      sha256 "eb0855cb580742f51e6742a9ccbe7eed6a2c87875625b12871ea943618411faf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.210/tierstore-0.3.210-linux-aarch64.tar.gz"
      sha256 "33c6e78f5177d4ab139e6f9a2f497881caad4485eed9caec58aec8ec72c060f5"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.210/tierstore-0.3.210-linux-x86_64.tar.gz"
      sha256 "1f9db5885d72c7c804d6f22f5b407a821ef6f241416606e65d01e41ba080e06f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
