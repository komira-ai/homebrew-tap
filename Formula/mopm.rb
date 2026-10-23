class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.33/mopm-0.0.33-macos-arm64.tar.gz"
      sha256 "53fb53a10a8c5a1c282fa68c05782bc7b796b324e974284f794a15de8ec84349"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.33/mopm-0.0.33-linux-aarch64.tar.gz"
      sha256 "0595cd7d44576de1e821cc4fa74814c000a72f78b101e04b3f62353b7e99844b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.33/mopm-0.0.33-linux-x86_64.tar.gz"
      sha256 "db3580cebb920f47783ea78863d2cb56e0b1608898677890227ed1a5f1afd968"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
