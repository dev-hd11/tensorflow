"""Provides the repository macro to import TFRT."""

load("//third_party:repo.bzl", "tf_http_archive")

def repo():
    """Imports TFRT."""

    # Attention: tools parse and update these lines.
    TFRT_COMMIT = "ecf8607212b519546828e3fcc66f68985597a622"
    TFRT_SHA256 = "545c097a241ff80701e54d1e088762f27a7494980f01c08fee3ce3aeb4fd22cf"

    tf_http_archive(
        name = "tf_runtime",
        sha256 = TFRT_SHA256,
        strip_prefix = "runtime-{commit}".format(commit = TFRT_COMMIT),
        urls = [
            "http://mirror.tensorflow.org/github.com/tensorflow/runtime/archive/{commit}.tar.gz".format(commit = TFRT_COMMIT),
            "https://github.com/tensorflow/runtime/archive/{commit}.tar.gz".format(commit = TFRT_COMMIT),
        ],
        # A patch file can be provided for atomic commits to both TF and TFRT.
        # The job that bumps the TFRT_COMMIT also resets patch_file to 'None'.
        patch_file = None,
    )
